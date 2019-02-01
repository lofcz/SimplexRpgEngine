using System;
using System.Collections.Generic;
using System.Text;

namespace SimplexCore
{
    public class Heap<T> where T : IHeapItem<T>
    {
        private T[] Items;
        private int ItemCount;

        public Heap(int maxSize)
        {
            Items = new T[maxSize];
        }

        public void Add(T item)
        {
            item.HeapIndex = ItemCount;
            Items[ItemCount] = item;

            SortUp(item);
            ItemCount++;
        }

        public void SortUp(T item)
        {
            int parentIndex = (item.HeapIndex - 1) / 2;
            
            while (true)
            {
                T parentItem = Items[parentIndex];

                // higher priory goes to the top
                if (item.CompareTo(parentItem) > 0)
                {
                    Swap(item, parentItem);
                }
                else
                {
                    break;
                }

                parentIndex = (item.HeapIndex - 1) / 2;
            }
        }

        public void UpdateItem(T item)
        {
            SortUp(item);
        }

        public int Count
        {
            get { return ItemCount; }
        }

        public bool Contains(T item)
        {
            return Equals(Items[item.HeapIndex], item);
        }

        public void SortDown(T item)
        {
            while (true)
            {
                int cIL = item.HeapIndex * 2 + 1;
                int cIR = item.HeapIndex * 2 + 2;
                int sI = 0;

                if (cIL < ItemCount)
                {
                    sI = cIL;

                    if (cIR < ItemCount)
                    {
                        // left / right children priority sort
                        if (Items[cIL].CompareTo(Items[cIR]) < 0)
                        {
                            sI = cIR;
                        }
                    }

                    if (item.CompareTo(Items[sI]) < 0)
                    {
                        Swap(item, Items[sI]);
                    }
                    else
                    {
                        return;
                    }
                }
                else
                {
                    return;
                }
            }
        }

        public T RemoveFirst()
        {
            T a = Items[0];
            ItemCount--;

            Items[0] = Items[ItemCount];
            Items[0].HeapIndex = 0;

            SortDown(Items[0]);
            return a;
        }

        public void Swap(T a, T b)
        {
            Items[a.HeapIndex] = b;
            Items[b.HeapIndex] = a;

            // old fashioned newbz swap, could go triple XOR too 
            int c = a.HeapIndex;
            a.HeapIndex = b.HeapIndex;
            b.HeapIndex = c;


        }

    }


    public interface IHeapItem<T> : IComparable<T>
    {
        int HeapIndex { get; set; }

    }
}
